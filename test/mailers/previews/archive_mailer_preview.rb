# Preview all emails at http://localhost:3000/rails/mailers/archive_mailer
class ArchiveMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/archive_mailer/article_archived
  def article_archived
    article = Article.last
    ArchiveMailer.article_archived(article)
  end

end
