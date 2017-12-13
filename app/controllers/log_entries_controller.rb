# Controller for users's log entries.
class LogEntriesController < ApplicationController
  # List all log entries.
  def index
    @log_entries = LogEntry.all
  end

  # Retrives a log entry ands shows it.
  def show
    @log_entry = LogEntry.find(params[:id])
  end

  # Displays the form to create a new log entry.
  def new
    @log_entry = LogEntry.new
  end

  # Displays the form to update a log entry.
  def edit
    @log_entry = LogEntry.find(params[:id])
  end

  # Creates a new log entry with the submited data.
  def create
    @log_entry = LogEntry.new(log_entry_params)

    if @log_entry.save
      redirect_to @log_entry
    else
      render 'new'
    end
  end

  # Updates a log entry with the submited data.
  def update
    @log_entry = LogEntry.find(params[:id])

    if @log_entry.update(log_entry_params)
      redirect_to @log_entry
    else
      render 'edit'
    end
  end

  # Destroys a log entry.
  def destroy
    @log_entry = LogEntry.find(params[:id])
    @log_entry.destroy

    redirect_to log_entries_path
  end

  private

  # Sets the allowed parameters for this controller.
  def log_entry_params
    params.require(:log_entry).permit(:user, :text, :for_date)
  end
end
