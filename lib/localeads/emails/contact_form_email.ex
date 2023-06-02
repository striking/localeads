defmodule Localeads.Emails.ContactFormEmail do
    import Swoosh.Email

    def new_lead(lead) do
        new()
        |> to({lead["first_name"], lead["email"]})
        |> from({"Chris O'Halloran", "chris@localeads.com.au"})
        |> subject("Localeads Contact Submission")
        |> text_body("Hi there #{lead["first_name"]},\n
        This is a quick email to let you know that we've recieved your contact request and someone from our team will be in touch shortly.\n 

        Details provided:
        Name: #{lead["first_name"]} #{lead["last_name"]}
        Email: #{lead["email"]}
        Phone: #{lead["phone"]}
        Address: #{lead["address"]}
        Suburb: #{lead["suburb"]}
        State: #{lead["state"]}, #{lead["post_code"]}
        Enquiry Type: #{lead["enquiry_type"]}
        
        Best Regards,
        Chris O'Halloran
        Localeads")
    end
end