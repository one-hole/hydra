class ApiError < StandardError
  attr :code, :text, :status

  def initialize(opts = {})
    @code = opts.fetch(:code, 2000)
    @text = opts.fetch(:text, 'errors happended')
    @status = opts.fetch(:status, 400)
  end
end

include ApiErrorConcern