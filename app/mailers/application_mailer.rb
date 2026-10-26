class ApplicationMailer < ActionMailer::Base
  default from: "VENÈ Jewelry <nadin@venejewelry.com>"
  layout "mailer"
  helper :application, :vene, :vene_email

  private

  def attach_logo
    logo_path = Rails.root.join("app", "assets", "images", "logo.jpg")
    attachments.inline["logo.jpg"] = File.read(logo_path) if File.exist?(logo_path)
  end
end
