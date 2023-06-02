defmodule LocaleadsWeb.PostersController do
  use LocaleadsWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger} = params) do
    render(conn, :show, messenger: messenger)
    
  end

  def submit(conn, params) do
    %{"first_name" => first_name, 
      "last_name" => last_name,
      "email" => email,
      "phone" => phone,
      "address" => address,
      "suburb" => suburb,
      "state" => state,
      "post_code" => post_code,
      "enquiry_type" => enquiry_type} = params

    IO.inspect(params, label: "handle info result:w")

      Localeads.Emails.ContactFormEmail.new_lead(
        %{"first_name" => first_name, 
          "last_name" => last_name,
          "email" => email,
          "phone" => phone,
          "address" => address,
          "suburb" => suburb,
          "state" => state,
          "post_code" => post_code,
          "enquiry_type" => enquiry_type})

    |> Localeads.Mailer.deliver()

    conn
      |> put_flash(:info, "Thanks, we'll be in touch!")

  end
end
