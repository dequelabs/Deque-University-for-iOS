Feature: Test Color Contrast Demos

# There should be no accessibility violations in the opening screen
Scenario: Test Opening Screen
    Given I see the text "Demos"
    Then Attest that port 8080 is accessible

# There are accessibility violations in the Color Contrast Rule in the "ContrastAlphaBlend" example -- ignore them
Scenario: Test Contrast Alpha Blend
    Given I touch "ContrastAlphaBlend"
    Then Attest that port 8080 is accessible except for rule Color Contrast

# There is one accessibility violation in the "Contrast" example
Scenario: Test Contrast
    Given I touch "Contrast"
    Then Attest that port 8080 is accessible with 1 violation

# There is one accessibility violation in the "ContrastLargeText" example in rule Color Contrast
Scenario: Test Contrast Large Text
    Given I touch "ContrastLargeText"
    Then Attest that port 8080 is accessible with 1 violation for rule Color Contrast

# If there is more than one violation, highlight all of the violations present on screen -- "with highlighting" can be tagged onto any Attest statement
Scenario: Test Contrast Alpha Blend Text
    Given I touch "ContrastAlphaBlendText"
    Then Attest that port 8080 is accessible with 1 violation for rule Color Contrast with highlighting
