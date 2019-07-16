Before do |scenario|
  @feature_name = scenario.feature.name
  @scenario_name = scenario.name
  $step_index = 0
  $passos = 1
  $stop_count = scenario.test_steps.count
  @scenario = scenario
  $path_passed = "C:/TC_AUTOMACAO/qa-tc/features/reports/Passed/#{@feature_name}/#{@scenario_name}"
  $path_fail = "C:/TC_AUTOMACAO/qa-tc/features/reports/Failed/#{@feature_name}/#{@scenario_name}"
  FileUtils.remove_dir($path_passed) if File.directory?($path_passed)
end

AfterStep do |_step|
  $step_name = "passo #{$passos} - #{@scenario.test_steps[$step_index].text}"
  screenshot = "#{$path_passed}/✅ #{$step_name.gsub(%r{["^$/]}, '')}.png"
  page.save_screenshot(screenshot)
  $step_index += 2
  $passos += 1
end

After do |scenario|
  if scenario.passed?
    FileUtils.remove_dir($path_fail) if File.directory?($path_fail)
  end
  if scenario.failed?
    FileUtils.mkdir_p $path_fail
    out_file = File.new("#{$path_fail}/falha.txt", 'w')
    out_file.puts("✖ falha no #{$step_name.gsub(%r{["^$/]}, '')}\n\n\n Mensagem do erro: #{$log_erro}")
    out_file.close
    FileUtils.remove_dir($path_passed) if File.directory?($path_passed)
    $step_name = "passo #{$passos} - #{@scenario.test_steps[$step_index].text}"
  end
  Capybara.current_session.driver.quit
end
