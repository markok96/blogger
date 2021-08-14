class ArticleMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.new_article.subject
  #
  default to: -> { Author.pluck(:email) },
          from: 'jonathanpeterson314@gmail.com'
          
  def new_article(article)
    @title = article.title

    mail(subject: "New Article Notification")
  end
end
