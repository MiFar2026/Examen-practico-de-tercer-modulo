<template>
  <div class="min-h-screen bg-blue-50">

    <!-- Navbar -->
    <nav class="bg-blue-800 text-white shadow-lg">
      <div class="container mx-auto flex justify-between items-center px-6 py-4">
        <h1 class="text-2xl font-bold">
          📚 Hamedan Book Events
        </h1>

        <div class="space-x-6">
          <a href="#home" class="hover:text-blue-200">Home</a>
          <a href="#about" class="hover:text-blue-200">About</a>
          <a href="#events" class="hover:text-blue-200">Events</a>
        </div>
      </div>
    </nav>

    <!-- Hero -->
    <section
      id="home"
      class="container mx-auto text-center py-16 px-6"
    >
      <h2 class="text-5xl font-extrabold text-blue-800 mb-6">
        Welcome to Hamedan Book Events
      </h2>

      <p class="text-blue-700 text-lg max-w-3xl mx-auto">
        Discover cultural events, book presentations, workshops and literary
        activities taking place in some of the best bookstores in Hamedan.
      </p>

      <button
        class="mt-8 bg-blue-700 hover:bg-blue-900 text-white px-8 py-3 rounded-lg shadow-lg transition"
      >
        Explore Events
      </button>
    </section>

    <!-- Libraries -->
    <section class="container mx-auto px-6 py-10">

      <h2 class="text-4xl text-center font-bold text-blue-800 mb-10">
        Featured Bookstores
      </h2>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

        <div
          class="bg-white rounded-2xl shadow-lg overflow-hidden hover:scale-105 transition duration-300"
        >
          <img
            src="/1369210.jpg"
            class="w-full h-64 object-cover"
            alt="Jahan-e-Danesh"
          />

          <div class="p-6">

            <h3 class="text-2xl font-bold text-blue-800 mb-3">
              Librería Jahan-e-Danesh
            </h3>

            <p class="text-gray-600">
              A modern bookstore offering cultural meetings, literature talks
              and educational activities.
            </p>

          </div>
        </div>

        <div
          class="bg-white rounded-2xl shadow-lg overflow-hidden hover:scale-105 transition duration-300"
        >
          <img
            src="/1362365.jpg"
            class="w-full h-64 object-cover"
            alt="Iran-Zameen"
          />

          <div class="p-6">

            <h3 class="text-2xl font-bold text-blue-800 mb-3">
              Librería Iran-Zameen
            </h3>

            <p class="text-gray-600">
              One of the most active literary spaces in Hamedan with exhibitions
              and reading clubs.
            </p>

          </div>
        </div>

        <div
          class="bg-white rounded-2xl shadow-lg overflow-hidden hover:scale-105 transition duration-300"
        >
          <img
            src="/1369211.png"
            class="w-full h-64 object-cover"
            alt="Golzardi"
          />

          <div class="p-6">

            <h3 class="text-2xl font-bold text-blue-800 mb-3">
              Golzardi-Malayer
            </h3>

            <p class="text-gray-600">
              A welcoming place for families, students and book lovers with
              weekly cultural events.
            </p>

          </div>
        </div>

      </div>

    </section>

    <!-- About -->
    <section
      id="about"
      class="container mx-auto py-16 px-6"
    >

      <h2 class="text-4xl text-center font-bold text-blue-800 mb-12">
        About Us
      </h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-10">

        <div class="bg-white rounded-xl shadow-lg p-8">

          <h3 class="text-3xl text-blue-800 font-bold mb-4">
            Our Mission
          </h3>

          <p class="text-gray-700 leading-8">
            We promote reading, culture and education through activities hosted
            by local bookstores in Hamedan. Our goal is to bring readers,
            authors and families together.
          </p>

        </div>

        <div class="bg-white rounded-xl shadow-lg p-8">

          <h3 class="text-3xl text-blue-800 font-bold mb-4">
            What We Offer
          </h3>

          <ul class="text-gray-700 space-y-3">

            <li>📖 Book presentations</li>

            <li>🎤 Meetings with authors</li>

            <li>👨‍👩‍👧 Activities for children</li>

            <li>📚 Reading clubs</li>

            <li>🎨 Workshops</li>

          </ul>

        </div>

      </div>

    </section>

    <!-- Events -->

    <section
      id="events"
      class="container mx-auto px-6 pb-16"
    >

      <h2 class="text-4xl text-center font-bold text-blue-800 mb-10">
        Upcoming Events
      </h2>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

        <div
          v-for="event in events"
          :key="event.EventID"
          class="bg-white rounded-xl shadow-lg p-6 border-l-8 border-blue-700 hover:shadow-2xl transition"
        >

          <h3 class="text-2xl font-bold text-blue-800 mb-4">
            {{ event.EventTitle }}
          </h3>

          <p class="mb-2">
            📅 {{ event.EventDate }}
          </p>

          <p class="mb-2">
            🕒 {{ event.EventTime }}
          </p>

          <p>
            👥 Capacity: {{ event.Capacity }}
          </p>

        </div>

      </div>

    </section>

    <!-- Footer -->

    <footer class="bg-blue-800 text-white text-center py-8">

      <p class="text-lg">
        © 2026 Hamedan Book Events
      </p>

    </footer>

  </div>
</template>

<script>
export default {
  name: "App",

  data() {
    return {
      events: [],
    };
  },

  async mounted() {
    try {
      const response = await fetch("http://localhost:5777/event");
      this.events = await response.json();
    } catch (error) {
      console.error(error);
    }
  },
};
</script>