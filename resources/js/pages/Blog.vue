<template>
    <div class="bg-dark">
       <h2 class="header-title">All Blog Posts</h2>
      <div class="searchbar">
        <form action="">
          <input type="text" placeholder="Search..." name="search" v-model="title" />

          <button type="submit">
            <i class="fa fa-search"></i>
          </button>

        </form>
      </div>
      <div class="categories">
        <ul>
          <li v-for="category in categories" :key="category.id">
            <a href="#" @click="filterByCategory(category.name)">{{category.name}}</a>
          </li> 
        </ul>
      </div>
     <section class="cards-blog latest-blog">

          <div class="card-blog-content" v-for="post in posts" :key="post.id">
            <img :src="post.imagePath" alt="" style="width:320px; height:260px;" />
            <p style="color:#fff;">
              {{post.created_at}}
              <span style="float: right; color:#fff;">Written By {{post.user}}</span>
            </p>
            <h4 style="font-weight: bolder">
              <router-link
               :to="{name:'SingleBlog',
                params:{slug: post.slug}}"
                >
                {{post.title}}
                </router-link
              >
            </h4>

          </div>
        </section>

        <h1 v-if="!posts.length">sorry! no match was found</h1>
        
          <!-- pagination -->
        <div class="pagination" id="pagination">
          <a href="#" v-for="(link, index) in links" 
          :key="index"
            v-html="link.label"
            :class="{active: link.active, disabled: !link.url}"
            @click="changePage(link)">
            </a>
        </div>
        
    </div>
</template>


<script>
    export default {
    emits: ['updateSidebar'],

      data(){
        return{
          posts: [],
          categories: [],
          title: '',
          links: []
        }
      },

      methods: {
        filterByCategory(name) {
          axios
            .get("/api/posts", {
              params: {
                category: name,
              },
            })
            .then((response) => {
              this.posts = response.data.data;
              this.links = response.data.meta.links;
            })
            .catch((error) => {
              console.log(error);
            });
       },

       changePage(link){
          if(!link.url || link.active){
            return;
          }

          axios
            .get(link.url)
            .then((response) => {
              this.posts = response.data.data;
              this.links = response.data.meta.links;
            })
            .catch((error) => {
              console.log(error);
            });
          
       }

      },


        watch: {
        title() {
          axios
            .get("/api/posts", {
              params: {
                search: this.title,
              },
            })
            .then((response) => {
              this.posts = response.data.data;
              this.links = response.data.meta.links;
            })
            .catch((error) => {
              console.log(error);
            });
        },
  },

      mounted(){
        axios.get('/api/posts')
          .then((response)=>{
            this.posts  =  response.data.data;
            this.links = response.data.meta.links;
          })
          .catch((error)=>{
            console.log(error);
          });

            axios.get('/api/categories')
            .then((response)=>{
              this.categories  =  response.data
            })
            .catch((error)=>{
              console.log(error);
            });
      }
    }
</script>

<style scoped>
.disabled{
  pointer-events: none;
}
</style>