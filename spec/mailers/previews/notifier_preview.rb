# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview
  def contact_form_email
    params = { contact_form: {
      first_name: 'Bob',
      last_name: 'Brown',
      email: 'bob@example.com',
      message: 'the rain in spain falls mainly on the plain'
    } }

    NotifierMailer.with(contact_form: params[:contact_form]).contact_form_email
  end
end
