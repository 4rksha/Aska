#pragma once

#ifdef ASKA_PLATFORM_WINDOWS

extern Aska::Application* Aska::CreateApplication();

int main(int argc, char** argv) 
{
	auto app = Aska::CreateApplication();
	app->Run();
	delete app;
}

#endif