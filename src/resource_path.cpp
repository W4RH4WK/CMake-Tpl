#include "example/resource_path.hpp"

extern "C" {
#include <libgen.h>
#include <linux/limits.h>
#include <unistd.h>
}

namespace {

#include "resource_path.def"

const char MARKER_FILE[] = "CMakeCache.txt";

bool exe_in_build_dir()
{
	char exe_path[PATH_MAX + 1];
	ssize_t n = readlink("/proc/self/exe", exe_path, PATH_MAX);
	if (n == -1) {
		return false;
	}
	exe_path[n] = '\0';

	char path[PATH_MAX + sizeof(MARKER_FILE) + 1];
	snprintf(path, sizeof(path), "%s/%s", dirname(exe_path), MARKER_FILE);

	return access(path, F_OK) == 0;
}

} // end namespace

namespace example {

std::string resource_path()
{
	static const char *path = nullptr;

	if (!path) {
		if (exe_in_build_dir()) {
			path = SOURCE_RESOURCE_DIR;
		} else {
			path = INSTALL_RESOURCE_DIR;
		}
	}

	return path;
}

} // end namespace example
