Feature: Bank Automated Bill Payment


  Background: Customer provides personal, account and billing information
    Given customer provides : <customer_id> <email_address> <account_id> <balance> <bill_id> <amount>
    And Environment specifications is provided as "Environment" with TOML body
    ```
    [Environment]
    description =  "is parsed using https://github.com/rouzikrm/gherkin-python"
    
    [cache]
    server = ""
    ports= []
    enabled = "true"
      [l1cache]
      ttl=10
      [l2cache]
      ttl=60
    ```     
  @owner="bob" @endpoint="/customer/pay_bill/" @tag
  Scenario: Teller pays customer's bill amount with bank account balance
    Rule: failed bill payments due to insufficient funds should be notified to the customer by email
    When the Teller pays a bill with the customer's bank account balance
    Then the Teller must raise exception if the customer's bank account balance is insufficient in comparison with the bill amount
