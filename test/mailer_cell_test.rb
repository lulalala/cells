require 'test_helper'

class MailerTest < MiniTest::Spec
  include Cell::TestCase::TestMethods

  describe 'Rails ActionMailer integration' do
    it "does not raise error and renders with full asset path" do
      mail = NewsletterMailer.daily
      assert_equal %Q{The Far Eastern Daily\n<img alt="Titanic" src="http://assets.example.com/images/titanic.jpg" />\n\n}, mail.body.to_s
    end
  end

  describe 'delegation to parent_controller' do
    before do
      @controller = Class.new(ActionMailer::Base).send(:new)
      @cell = cell(:newsletter)
    end
    it "delegate config" do
      assert_equal @controller.config, @cell.config
    end
    it "delegate url_options" do
      assert_equal @controller.url_options, @cell.url_options
    end
  end
end
