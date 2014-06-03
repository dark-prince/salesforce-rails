class SalesforceController < ::ApplicationController

  def calendar_json_data
    events = Salesforce::Rails::API::Calendar::Event.query("StartDateTime >= #{Time.at(params[:start].to_i).strftime("%Y-%m-%dT%H:%M:%SZ")} and StartDateTime <= #{Time.at(params[:end].to_i).strftime("%Y-%m-%dT%H:%M:%SZ")}")

    respond_to do |format|
      format.json { render json: events ? events.map { |e| { :id => e.id, :title => (e.is_all_day_event ? "All Day Event" : e.subject), :allDay => e.is_all_day_event, :start => e.start_date, :end => e.end_date, :start_date => e.start_date, :end_date => e.end_date, :color => (e.show_as == "Busy" ? "#6777cc" : "#b64b32"), :backgroundColor => (e.show_as == "Busy" ? "#6777cc" : "#b64b32"), :subject => e.subject, :assign_to => e.assign_to, :description => e.description, :show_as => e.show_as } } : nil }
    end
  end
end