/// file_name : "File.pdf"
/// file_type : "application/pdf"
/// file_url : "https://cdn-domain.tld/path/to/file.pdf"
/// resource_type : "file"

class AttachmentModel {
  AttachmentModel({
      this.fileName, 
      this.fileType, 
      this.fileUrl, 
      this.resourceType,});

  AttachmentModel.fromJson(dynamic json) {
    fileName = json['file_name'];
    fileType = json['file_type'];
    fileUrl = json['file_url'];
    resourceType = json['resource_type'];
  }
  String? fileName;
  String? fileType;
  String? fileUrl;
  String? resourceType;
AttachmentModel copyWith({  String? fileName,
  String? fileType,
  String? fileUrl,
  String? resourceType,
}) => AttachmentModel(  fileName: fileName ?? this.fileName,
  fileType: fileType ?? this.fileType,
  fileUrl: fileUrl ?? this.fileUrl,
  resourceType: resourceType ?? this.resourceType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_name'] = fileName;
    map['file_type'] = fileType;
    map['file_url'] = fileUrl;
    map['resource_type'] = resourceType;
    return map;
  }

}