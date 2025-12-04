class ApiResponse<T>{
final String? message;
final bool success;
final T? data;
final int? statusCode;
ApiResponse({
  required this.success,
  this.message,
  this.data,
  this.statusCode,
});

//factory for constructor for success response
factory ApiResponse.success(T data ,{String? message,int?statusCode}){
  return ApiResponse(
      success: true,
  data: data,
  message: message,
  statusCode: statusCode??200,);
}
factory ApiResponse.error(String message,{int?statusCode}){
  return ApiResponse(
      success: false,
  message: message,
  statusCode: statusCode??500);
}
//check if response have data
bool get hasData=> data!=null;
@override
  String toString(){
  return 'ApiResponse{success: $success, message: $message, data: $data, statusCode: $statusCode}';
}
}