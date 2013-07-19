
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::Job do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe Rufus::Scheduler::Job do
  end

  describe Rufus::Scheduler::OneTimeJob do
  end

  describe Rufus::Scheduler::AtJob do

    describe '#unschedule' do

      it 'unschedules the job' do

        job = @scheduler.at(Time.now + 3600, :job => true) do
        end

        job.unschedule

        sleep 0.4

        @scheduler.jobs.size.should == 0
      end
    end

    describe '#scheduled_at' do

      it 'returns the Time at which the job got scheduled' do

        job = @scheduler.schedule_at((t = Time.now) + 3600) {}

        job.scheduled_at.to_i.should >= t.to_i - 1
        job.scheduled_at.to_i.should <= t.to_i + 1
      end
    end
  end

  describe Rufus::Scheduler::InJob do

    #describe '#unschedule' do
    #  it 'unschedules the job'
    #end
  end

  describe Rufus::Scheduler::RepeatJob do
  end

  describe Rufus::Scheduler::EveryJob do

    #describe '#unschedule' do
    #  it 'unschedules the job'
    #end
  end

  describe Rufus::Scheduler::CronJob do

    #describe '#unschedule' do
    #  it 'unschedules the job'
    #end
  end
end

