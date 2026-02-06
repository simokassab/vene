class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    attach_logo
    mail(to: order.email, subject: I18n.t("mailers.order_mailer.confirmation.subject", id: order.id))
  end

  def admin_notification(order)
    @order = order
    attach_logo
    mail(to: ENV.fetch("ADMIN_NOTIFICATION_EMAIL", "nadin@venejewelry.com"), subject: I18n.t("mailers.order_mailer.admin_notification.subject", id: order.id))
  end
end
