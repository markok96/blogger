class ArchiveMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.archive_mailer.article_archived.subject
  #
  def article_archived(article)
    @user = article.author.username
    @title = article.title
    @email = article.author.email

    mail(
       from: 'jonathanpeterson314@gmail.com',
       to: @email, 
       subject: "Article #{@title} has been archived"
      )
  end
end
