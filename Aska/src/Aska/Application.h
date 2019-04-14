#pragma once

#include "Core.h"

#include "Window.h"
#include "Aska/LayerStack.h"
#include "Aska/Events/Event.h"
#include "Aska/Events/ApplicationEvent.h" 



namespace Aska {

	class ASKA_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* layer);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// To be define in client.
	Application* CreateApplication();

}