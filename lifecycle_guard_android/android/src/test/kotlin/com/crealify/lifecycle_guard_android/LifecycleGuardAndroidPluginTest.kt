package com.crealify.lifecycle_guard_android

import kotlin.test.Test
import kotlin.test.assertNotNull

/*
 * Unit tests for the LifecycleGuardPlugin.
 *
 * Run from the command line:
 *   ./gradlew testDebugUnitTest
 * in the `lifecycle_guard_android/example/android/` directory.
 */
internal class LifecycleGuardAndroidPluginTest {
    @Test
    fun pluginInitializes() {
        val plugin = LifecycleGuardPlugin()
        assertNotNull(plugin)
    }
}
