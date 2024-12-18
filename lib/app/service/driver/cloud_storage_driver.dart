abstract class CloudStorageDriver {
  /// Initialize the driver with necessary configurations.
  Future<void> initialize();

  /// List files in the specified directory.
  Future<List<CloudFile>> listFiles(String path);

  /// Generate a downloadable link for the specified file.
  Future<String> generateDownloadLink(String filePath);

  /// Create a new directory within the specified parent directory.
  Future<void> createDirectory(String parentPath, String directoryName);

  /// Move a file or directory to a new location.
  Future<void> move(String sourcePath, String destinationPath);

  /// Rename a file or directory.
  Future<void> rename(String filePath, String newName);

  /// Remove a file or directory.
  Future<void> delete(String path);

  /// Upload a file to the cloud storage.
  Future<void> uploadFile(String targetPath, Stream<List<int>> fileStream, {Function(double)? onProgress});
}

class CloudFile {
  final String name;
  final String path;
  final bool isDirectory;
  final int size;

  CloudFile({required this.name, required this.path, this.isDirectory = false, this.size = 0});
}
