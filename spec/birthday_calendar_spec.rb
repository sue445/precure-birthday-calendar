RSpec.describe BirthdayCalendar do
  let(:calendar) { BirthdayCalendar.new(config_name) }

  let(:config_name) { "precure" }

  let(:hagtan)    { Hashie::Mash.new(name: "はぐたん", birthday: "10/21") }
  let(:cure_star) { Hashie::Mash.new(name: "キュアスター(星奈ひかる)", birthday: "4/12") }

  describe ".generate_all_ical_files" do
    include_context "uses temp dir"

    subject { BirthdayCalendar.generate_all_ical_files(temp_dir) }

    it "files are exists" do
      subject

      expect(temp_dir_path.join("precure.ics")).to be_exist
      expect(temp_dir_path.join("sub_characters.ics")).to be_exist
      expect(temp_dir_path.join("dancing_star.ics")).to be_exist
    end
  end

  describe "#generate_ical_file" do
    include_context "uses temp dir"

    subject do
      calendar.generate_ical_file(temp_dir)

      temp_dir_path.join("precure.ics")
    end

    it { should be_exist }
  end

  describe "#birthdays" do
    subject { calendar.birthdays(from_year: from_year, to_year: to_year) }

    let(:from_year) { 2018 }
    let(:to_year)   { 2020 }

    context "config/precure.yml" do
      let(:config_name) { "precure" }

      it { should include(CalendarRow.new(date: Date.new(2018, 4, 12), chara: cure_star)) }
    end

    context "config/sub_characters.yml" do
      let(:config_name) { "sub_characters" }

      it { should include(CalendarRow.new(date: Date.new(2018, 10, 21), chara: hagtan)) }
    end
  end

  describe "#birthday_ical" do
    subject { calendar.birthday_ical(calendar_rows) }

    let(:calendar_rows) do
      [
        CalendarRow.new(date: Date.new(2018, 10, 21), chara: hagtan),
        CalendarRow.new(date: Date.new(2018, 4, 12), chara: cure_star),
      ]
    end

    it { should include "X-WR-CALNAME;VALUE=TEXT:プリキュアの誕生日" }
    it { should include "DTSTART;VALUE=DATE:20181021\r\nSUMMARY:はぐたんの誕生日\r\n" }
    it { should include "DTSTART;VALUE=DATE:20180412\r\nSUMMARY:キュアスター(星奈ひかる)の誕生日\r\n" }
  end
end
