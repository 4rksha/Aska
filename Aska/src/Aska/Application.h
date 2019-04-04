#pragma once

#include "Core.h"

namespace Aska {

	class ASKA_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be define in client.
	Application* CreateApplication();

}