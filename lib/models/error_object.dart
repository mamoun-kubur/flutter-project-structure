enum ErrorObject{
  networkError('Something went wrong with the Internet connection'),
  serverError('Something went wrong with the server'),
  unknownError('Something went wrong');
  final String msg;
  const ErrorObject(this.msg);
}