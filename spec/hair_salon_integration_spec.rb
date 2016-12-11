require('spec_helper')

describe('the new stylist path', {:type => :feature}) do
  it('displays a new stylists name when user inputs a new stylist') do
    visit('/')
    fill_in('new_stylist', :with => 'Yoko')
    click_button("Add Stylist")
    expect(page).to have_content('Yoko')
  end
end

describe('the new client path', {:type => :feature}) do
  it('displays a new clients name when user inputs a new client') do
    visit('/')
    fill_in('new_client', :with => 'Yoko')
    click_button("Add Client")
    expect(page).to have_content('Yoko')
  end
end

describe("the list of stylist's clients path", {:type => :feature}) do
  it("displays a list of a stylist's client when user clicks the stylist's name") do
    visit('/')
    fill_in('new_stylist', :with => 'Julia')
    click_button("Add Stylist")
    fill_in('new_client', :with => 'Yoko')
    find('#new_client_stylist').find(:xpath, 'option[2]').select_option
    click_button("Add Client")
    click_link('Julia')
    expect(page).to have_content("Julia's Clients: Yoko")
  end
end

describe("the delete stylist path", {:type => :feature}) do
  it("deletes a stylist when user clicks on the stylist's name and then clicks on the delete button") do
    visit('/')
    fill_in('new_stylist', :with => 'Julia')
    click_button("Add Stylist")
    click_link('Julia')
    click_button('Delete This Stylist')
    expect(page).to_not have_content("Julia")
  end
end

describe("the display client page path", {:type => :feature}) do
  it("displays a client's page with current stylist when a user clicks the client's name.") do
    visit('/')
    fill_in('new_stylist', :with => 'Julia')
    click_button("Add Stylist")
    fill_in('new_client', :with => 'Yoko')
    find('#new_client_stylist').find(:xpath, 'option[2]').select_option
    click_button("Add Client")
    click_link('Yoko')
    expect(page).to have_content("Client: Yoko Current Stylist: Julia")
  end
end

describe("the delete client path", {:type => :feature}) do
  it("deletes a client from the database when user click the 'Delete This Client' button.") do
    visit('/')
    fill_in('new_client', :with => 'Yoko')
    click_button("Add Client")
    click_link('Yoko')
    click_button("Delete This Client")
    expect(page).to_not have_content("Yoko")
  end
end

describe("the update client's stylist path", {:type => :feature}) do
  it("changes a client's stylist when user selects a new stylist and clicks the update button.") do
    visit('/')
    fill_in('new_stylist', :with => 'Julia')
    click_button("Add Stylist")
    fill_in('new_client', :with => 'Yoko')
    click_button("Add Client")
    click_link('Yoko')
    find('#stylist_update').find(:xpath, 'option[1]').select_option
    click_button('Update Stylist')
    click_link('Julia')
    expect(page).to have_content("Julia's Clients: Yoko")
  end
end

describe("the return to main page from client page path", {:type => :feature}) do
  it("returns to the main page from a client's page when user clicks the link") do
    visit('/')
    fill_in('new_client', :with => 'Yoko')
    click_button("Add Client")
    click_link('Yoko')
    click_link('Return to Main Page')
    expect(page).to have_content("Welcome to Devin's Hair Salon")
  end
end
