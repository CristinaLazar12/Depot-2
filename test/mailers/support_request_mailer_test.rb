require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase

  test "respond" do

    support_request = SupportRequest.new(
      email: "to@example.org",
      subject: "Subject",
      body: "Hi"
    )

    mail = SupportRequestMailer.respond(support_request)
    assert_equal "Re: Subject", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "support@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
