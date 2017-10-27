module JotControllerHelper
  def find_and_ensure(id)
    jot = Jot.find(id)
    halt(404, erb(:'404')) if jot.nil?
    jot
  end
end

helpers JotControllerHelper
