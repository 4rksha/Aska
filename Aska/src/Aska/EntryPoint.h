#pragma once

#ifdef ASKA_PLATFORM_WINDOWS

extern Aska::Application* Aska::CreateApplication();

int main(int argc, char** argv) 
{
	Aska::Log::Init();
	ASKA_CORE_WARN("Initialzed Log!");
	ASKA_CORE_INFO("Hello!");

	auto app = Aska::CreateApplication();
	app->Run();
	delete app;
}

#endif