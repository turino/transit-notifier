require "rails_helper"

describe BartApi::Station do
	describe "#report_departures" do
		it "returns an time report for each train" do
			allow(BartApi::Base).to receive(:get_json).
				and_return(JSON.parse(file_fixture("starting_report.json").read))	
			station = BartApi::Station.new(:mont)
			report = station.report_departures

			expect(report).to eq("Pittsburg/Bay Point: 3, 18 (2 min delay), 33\nRichmond: 11, 26, 41")
		end
	end

	describe "#report_delays" do
		it "returns an time report for each train" do
			allow(BartApi::Base).to receive(:get_json).
				and_return(JSON.parse(file_fixture("starting_report.json").read))	
			station = BartApi::Station.new(:mont)
			report = station.report_delays

			expect(report).to eq("Pittsburg/Bay Point: 0, 2, 0\nRichmond: 0, 0, 0")
		end
	end 
end