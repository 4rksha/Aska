#include "Aska.h"

class Sandbox : public Aska::Application
{
public:
	Sandbox()
	{

	}
	~Sandbox()
	{

	}
};

Aska::Application* Aska::CreateApplication()
{
	return new Sandbox();
}