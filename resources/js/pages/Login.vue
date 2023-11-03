<template>
    <div id="backend-view">
     <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                   <form @click.prevent="submit">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="text" id="email" class="form-control" v-model="fields.email">
                        <span class="text-danger" v-if="errors.email">{{errors.email[0]}}</span>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" v-model="fields.password">
                        <span class="text-danger" v-if="errors.password">{{errors.password[0]}}</span>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Login</button>
                    &nbsp; &nbsp; <span>Don't have an account?</span> <router-link :to="{name: 'Register'}">Sign Up</router-link>
                </form>
            </div>
        </div>
     </div>

    </div>
</template>

<script>
export default {

    data(){
        return{
            fields:{},
            errors: {}
        }
    },


    methods:{
        submit(){
           axios
             .post('/api/login', this.fields)
             .then(()=>{
                this.$router.push({name:'Dashboard'});
                localStorage.setItem("authenticated", "true");
                this.$emit("updateSidebar");
             }).catch((error)=>{
                this.errors = error.response.data.errors 
             })
        } 
    }
    
}
</script>