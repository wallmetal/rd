Feature: Contacts

  In order of watch all contacts
  
  @javascript
  Scenario: Watch all contacts
    Given there's a contact with email "asd@mail.com" and the visitor_cookie "437278343498"
    Given there's a contact with email "fgt@mail.com" and the visitor_cookie "285275785777"
    Then I should not see the message "asd@mail.com"
    Then I should not see the message "fgt@mail.com"
    Then I should be on "/" page


