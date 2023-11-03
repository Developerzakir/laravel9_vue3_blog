<template>
 <div id="backend-view" >
    <div class="logout d-flex justify-content-end"><a href="#" @click="logout" >Log out</a></div>
    <h1 class="heading">Dashboard</h1>
    <span>Hi {{name}}</span>
    <div class="links d-flex justify-content-center">
      <ul>
        
        <li>
          <router-link :to="{name: 'CreatePosts'}"
            >Create Posts</router-link
          >
        </li>

        <li>
          <router-link :to="{name: 'DashboardPostsList'}">Posts List</router-link>
        </li>
        <li>
          <router-link :to="{name: 'CreateCategories'}"
            >Create Categories</router-link
          >
        </li>
        <li>
          <router-link :to="{name: 'CategoryList'}"
            >Categories List</router-link
          >
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      name: ''
    }
  },

  mounted(){
    axios.get('/api/user')
    .then((response)=>{
       this.name  =  response.data.name
    })
    .catch((error)=>{
      console.log(error);
    })
  },

  methods:{
    logout(){
      axios.post('/api/logout')
       .then((response)=>{
        this.$router.push({name: 'Home'})
        localStorage.removeItem('authenticated');
        this.$emit("updateSidebar");
       })
       .catch((error)=>{
        console.log(error);
       })
    }
  }
}
</script>