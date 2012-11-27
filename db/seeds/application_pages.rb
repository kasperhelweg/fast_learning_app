# encoding: utf-8

# Homepage
home_page = Page.create(title: "Homepage", content: 
                        '<a href="/users/sign_out" data-method="delete" rel="nofollow">Sign out</a>'
                        )
homepage = ApplicationPage.new(location: "root")
homepage.page = home_page

# About page
about_page = Page.create(title: "Om Fastlearning_app")
aboutpage = ApplicationPage.new(location: "header")
aboutpage.page = about_page

# Terms page
terms_page = Page.create(title: "Vilkår")
termspage = ApplicationPage.new(location: "header")
termspage.page = terms_page

homepage.save
aboutpage.save
termspage.save
