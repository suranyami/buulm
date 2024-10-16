defmodule Mix.Tasks.Buulm.InstallTest do
  use ExUnit.Case, async: true
  import Mox

  setup do
    Mix.shell(ShellMock)

    on_exit(fn ->
      # Clean up the component directory after tests
      File.rm_rf!("lib/buulm_web")
    end)

    :ok
  end

  describe "run/1" do
    test "installs a component if it exists" do
      expect(ShellMock, :info, fn msg ->
        assert msg ==
                 "glow_button component installed successfully ✅ - lib/buulm_web/components/glow_button.ex"
      end)

      expect(ShellMock, :info, fn msg ->
        assert msg ==
                 "Don't forget to import the component to your buulm_web.ex` file."
      end)

      Mix.Tasks.Buulm.Install.run(["glow_button"])
    end

    test "prints error if component does not exist" do
      expect(ShellMock, :error, fn msg ->
        assert msg == "Component not found: nonexistent_component"
      end)

      expect(ShellMock, :info, fn msg ->
        assert msg == "Usage: mix buulm.install [component_name]"
      end)

      expect(ShellMock, :info, fn msg ->
        assert msg ==
                 "Available components: avatar | glow_button | code_snippet | hero | gradient_text | bento_grid | card | marquee | sound_effect"
      end)

      Mix.Tasks.Buulm.Install.run(["nonexistent_component"])
    end

    test "prints usage and available components if no arguments are given" do
      expect(ShellMock, :info, fn msg ->
        assert msg == "Usage: mix buulm.install [component_name]"
      end)

      expect(ShellMock, :info, fn msg ->
        assert msg ==
                 "Available components: avatar | glow_button | code_snippet | hero | gradient_text | bento_grid | card | marquee | sound_effect"
      end)

      Mix.Tasks.Buulm.Install.run([])
    end
  end

  describe "install_component/1" do
    setup do
      # Setup to mock the filesystem and Mix.Project.config()
      {:ok, %{project_name: "test_app"}}
    end

    test "creates component file and writes updated source code", %{project_name: _project_name} do
      expect(ShellMock, :info, fn msg ->
        assert msg ==
                 "glow_button component installed successfully ✅ - lib/buulm_web/components/glow_button.ex"
      end)

      expect(ShellMock, :info, fn msg ->
        assert msg ==
                 "Don't forget to import the component to your buulm_web.ex` file."
      end)

      Mix.Tasks.Buulm.Install.install_component("glow_button")
    end
  end
end
