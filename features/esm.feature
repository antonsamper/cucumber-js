Feature: ES modules support

  cucumber-js works with native ES modules, via a Cli flag `--esm`

  @esm
  Scenario: native module syntax works when using --esm
    Given a file named "features/a.feature" with:
      """
      Feature:
        Scenario:
          Given a step passes
      """
    And a file named "features/step_definitions/cucumber_steps.js" with:
      """
      import {Given} from '@cucumber/cucumber'

      Given(/^a step passes$/, function() {});
      """
    When I run cucumber-js with `--esm`
    Then it passes

  Scenario: native module syntax doesn't work without --esm
    Given a file named "features/a.feature" with:
      """
      Feature:
        Scenario:
          Given a step passes
      """
    And a file named "features/step_definitions/cucumber_steps.js" with:
      """
      import {Given} from '@cucumber/cucumber'

      Given(/^a step passes$/, function() {});
      """
    When I run cucumber-js
    Then it fails