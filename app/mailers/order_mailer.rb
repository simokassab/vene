class OrderMailer < ApplicationMailer
  default from: "no-reply@venejewelry.com"

  def confirmation(order)
    @order = order
    mail(to: order.email, subject: I18n.t("mailers.order_mailer.confirmation.subject", id: order.id))
  end

  def admin_notification(order)
    @order = order
    mail(to: ENV.fetch("ADMIN_NOTIFICATION_EMAIL", "admin@venejewelry.com"), subject: I18n.t("mailers.order_mailer.admin_notification.subject", id: order.id))
  end
end
