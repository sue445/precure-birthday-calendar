RSpec.describe BirthdayCalendar do
  let(:calendar) { BirthdayCalendar.new(config_name) }

  let(:config_name) { "precure" }

  let(:hagtan)    { Hashie::Mash.new(name: "はぐたん", birthday: "10/21") }
  let(:cure_star) { Hashie::Mash.new(name: "キュアスター(星奈ひかる)", birthday: "4/12") }

  # describe ".generate_all_ical_files" do
  #   include_context "uses temp dir"
  #
  #   subject do
  #     BirthdayCalendar.generate_all_ical_files(temp_dir)
  #
  #     temp_dir_path.join("prichan.ics")
  #   end
  #
  #   it { should be_exist }
  # end
  #
  # describe "#generate_ical_file" do
  #   include_context "uses temp dir"
  #
  #   subject do
  #     calendar.generate_ical_file(temp_dir)
  #
  #     temp_dir_path.join("prichan.ics")
  #   end
  #
  #   it { should be_exist }
  # end

  describe "#birthdays" do
    subject { calendar.birthdays(from_year: from_year, to_year: to_year) }

    let(:from_year) { 2018 }
    let(:to_year)   { 2020 }

    it { should include(CalendarRow.new(date: Date.new(2018, 10, 21), chara: hagtan)) }
    it { should include(CalendarRow.new(date: Date.new(2018, 4, 12), chara: cure_star)) }
  end

  # describe "#birthday_ical" do
  #   subject { calendar.birthday_ical(calendar_rows) }
  #
  #   let(:calendar_rows) do
  #     [
  #       CalendarRow.new(date: Date.new(2018, 7, 12), chara: mirai),
  #       CalendarRow.new(date: Date.new(2018, 9, 9),  chara: emo),
  #     ]
  #   end
  #
  #   it { should include "X-WR-CALNAME;VALUE=TEXT:キラッとプリ☆チャンの誕生日" }
  #   it { should include "DTSTART;VALUE=DATE:20180712\r\nDESCRIPTION:デコレーションケーキの日\r\nSUMMARY:桃山みらいの誕生日\r\n" }
  #   it { should include "DTSTART;VALUE=DATE:20180909\r\nDESCRIPTION:ポップコーンの日\r\nSUMMARY:萌黄えもの誕生日\r\n" }
  # end
end
