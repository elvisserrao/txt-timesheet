
module Timesheet

  def convert(time_in_minutes)
    ### Convert working time to hh:mm format
    hours = time_in_minutes / 60
    minutes = time_in_minutes - hours * 60
    ## Add 0 to keep hh: mm format
    "%02d:%02d" % [hours, minutes]
  end
end
