class CatRequestWorker
  include Sidekiq::Worker

  def perform id
    cat_request = CatRequest.find id
    cat_request.fulfill
  end
end
