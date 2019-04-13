#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Window.h"

#include "Aska/Events/ApplicationEvent.h"


namespace Aska {

	class ASKA_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be define in client.
	Application* CreateApplication();

}