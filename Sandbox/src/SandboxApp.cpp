#include "Aska.h"

class ExampleLayer : public Aska::Layer
{
public: 
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
	}

	void OnEvent(Aska::Event& event) override
	{
		ASKA_TRACE("{0}", event);
	}
};



class Sandbox : public Aska::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Aska::ImGuiLayer());
	}
	~Sandbox()
	{

	}
};

Aska::Application* Aska::CreateApplication()
{
	return new Sandbox();
}