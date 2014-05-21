class CatRequestWorker
  include Sidekiq::Worker

  def perform id
    cat_request = CatRequest.where(id: id).first
    cat_request.fulfill if cat_request
  end
end
