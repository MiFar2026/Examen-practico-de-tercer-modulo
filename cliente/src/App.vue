import EventInfo from "/cliente/src/components/eventInfo.vue";  
<template>
  <div class="min-h-screen bg-orange-50 p-8">
    <h1 class="text-4xl font-bold text-orange-700 mb-6">
      Hamedan Book Events: One library, one cultural life.

    </h1>
    <EventInfo />
    <p class="mb-6">
      Cultural events in Hamedan bookstores.

    </p>
    <div
      v-for="event in events"
      :key="event.EventID"
      class="bg-white shadow rounded p-4 mb-4"
    >
      <h2 class="text-xl font-bold">
        {{ event.EventTitle }}
      </h2>
      <p>
        Date: {{ event.EventDate }}
      </p>
      <p>
        Time: {{ event.EventTime }}
      </p>
      <p>
        Capacity: {{ event.Capacity }}
      </p>
    </div>
  </div>
</template>

<script>

export default {
    name: "App",
    data() {
        return {
            events: []
        };
    },

    components: {
    EventInfo
}
    async mounted() {
        try {
            const response = await fetch("http://localhost:5555/event");
            this.events = await response.json();
        }
        catch (error) {
            console.log(error);
        }
        finally {
            console.log("Fetch completed.");
        }
    }
}

</script>