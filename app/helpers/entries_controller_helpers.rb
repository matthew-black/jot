  #--Melissa's thingy. Play around with it later--#
module EntryControllerHelper
  def find_and_ensure(id)
    entry = Entry.find(id)
    halt(404, erb(:'404')) if entry.nil?
    entry
  end
end

helpers EntryControllerHelper
