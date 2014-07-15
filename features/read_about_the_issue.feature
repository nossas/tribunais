Feature: read about the issue

  Scenario: when I'm a human
    When I go to "the homepage"
    Then I should see "the first slide of content"
    And I should see "the second slide of content"
    And I should see "the third slide of content"
