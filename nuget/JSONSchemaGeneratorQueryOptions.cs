using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.JSONSchemaGenerator
{
    /// <summary>
    /// Query options for the JSON Schema Generator API
    /// </summary>
    public class JSONSchemaGeneratorQueryOptions
    {
        /// <summary>
        /// The sample JSON data to generate a schema from
        /// </summary>
        [JsonProperty("json")]
        public string Json { get; set; }

        /// <summary>
        /// The title for the generated schema (default: 'Generated Schema')
        /// </summary>
        [JsonProperty("title")]
        public string Title { get; set; }

        /// <summary>
        /// Optional description for the schema
        /// </summary>
        [JsonProperty("description")]
        public string Description { get; set; }
    }
}
