import 'dart:ffi' as ffi;
import 'dart:isolate' show Isolate;

import 'package:derry/error.dart' show DerryError, ErrorCode;
import 'package:derry/src/error/error_codes/invalid_blob_error.dart';
import 'package:derry/src/error/error_codes/invalid_package_uri_error.dart';
import 'package:derry/src/error/error_codes/platform_not_supported_error.dart';
import 'package:ffi/ffi.dart' show StringUtf8Pointer, Utf8;
import 'package:path/path.dart' as path;

const packageUri = 'package:derry/derry.dart';
const blobsPath = 'src/blobs/';

/// Supported operating systems with architectures
/// mapped to blob file extensions.
const supported = <ffi.Abi, String>{
  ffi.Abi.windowsX64: 'windows_x64.dll',
  ffi.Abi.linuxX64: 'linux_x64.so',
  ffi.Abi.macosX64: 'macos_x64.dylib',
  ffi.Abi.macosArm64: 'macos_arm64.dylib',
};

/// Gets the file name of blob files based on platform
///
/// File name doesn't contain directory paths.
String getBlobFilename() {
  final currentAbi = ffi.Abi.current();

  if (!supported.containsKey(currentAbi)) {
    throw PlatformNotSupportedError(abi: currentAbi);
  }

  return supported[currentAbi]!;
}

/// Run a given input string in console in native code via dart ffi
Future<int> runScript(String script) async {
  final resolvedPackageUri =
      await Isolate.resolvePackageUri(Uri.parse(packageUri));
  if (resolvedPackageUri == null) {
    throw InvalidPackageUriError(packageUri: packageUri);
  }

  final objectFilePath = resolvedPackageUri
      .resolve(path.join(blobsPath, getBlobFilename()))
      .toFilePath();
  late ffi.DynamicLibrary dylib;
  try {
    dylib = ffi.DynamicLibrary.open(objectFilePath);
  } catch (e) {
    throw InvalidBlobError(path: objectFilePath, origin: e);
  }

  final nativeRunScriptFn = dylib
      .lookup<ffi.NativeFunction<ffi.Int32 Function(ffi.Pointer<Utf8>)>>(
          'run_script')
      .asFunction<int Function(ffi.Pointer<Utf8>)>();

  return nativeRunScriptFn(script.toNativeUtf8());
}
