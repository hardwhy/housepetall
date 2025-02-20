abstract class BaseUsecase<Request, Response> {
  Future<Response> call(Request request);
}

abstract class BaseUsecaseNoRequest<Response> {
  Future<Response> call();
}
