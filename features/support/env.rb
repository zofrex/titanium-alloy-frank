require 'frank-cucumber'

# UIQuery is deprecated. Please use the shelley selector engine. 
Frank::Cucumber::FrankHelper.use_shelley_from_now_on

# This constant must be set to the full, absolute path for your Frankified target's app bundle.
# See the "Given I launch the app" step definition in launch_steps.rb for more details
APP_BUNDLE_PATH = File.expand_path( '../../../build/iphone/build/Debug-iphonesimulator/Lemonade.app', __FILE__ )

module SimulatorWorld
  @@simulator = nil

  def simulator
    if @@simulator.nil?
      create_simulator
      start_simulator
    end
    @@simulator
  end

  def restart_simulator
    @@simulator.quit_simulator
    start_simulator
  end

  def create_simulator
    @@simulator = SimLauncher::Simulator.new
  end

  def start_simulator
    @@simulator.launch_ios_app(APP_BUNDLE_PATH, nil, "iphone")
    wait_for_frank_to_come_up
  end
end

World(SimulatorWorld)

Before do
  @simulator = simulator
end
