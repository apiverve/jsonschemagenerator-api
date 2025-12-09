// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     JSONSchemaGeneratorData data = Converter.fromJsonString(jsonString);

package com.apiverve.jsonschemagenerator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static JSONSchemaGeneratorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(JSONSchemaGeneratorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(JSONSchemaGeneratorData.class);
        writer = mapper.writerFor(JSONSchemaGeneratorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// JSONSchemaGeneratorData.java

package com.apiverve.jsonschemagenerator.data;

import com.fasterxml.jackson.annotation.*;

public class JSONSchemaGeneratorData {
    private Schema schema;
    private SampleData sampleData;

    @JsonProperty("schema")
    public Schema getSchema() { return schema; }
    @JsonProperty("schema")
    public void setSchema(Schema value) { this.schema = value; }

    @JsonProperty("sample_data")
    public SampleData getSampleData() { return sampleData; }
    @JsonProperty("sample_data")
    public void setSampleData(SampleData value) { this.sampleData = value; }
}

// SampleData.java

package com.apiverve.jsonschemagenerator.data;

import com.fasterxml.jackson.annotation.*;

public class SampleData {
    private String name;
    private long age;
    private String email;
    private boolean active;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("age")
    public long getAge() { return age; }
    @JsonProperty("age")
    public void setAge(long value) { this.age = value; }

    @JsonProperty("email")
    public String getEmail() { return email; }
    @JsonProperty("email")
    public void setEmail(String value) { this.email = value; }

    @JsonProperty("active")
    public boolean getActive() { return active; }
    @JsonProperty("active")
    public void setActive(boolean value) { this.active = value; }
}

// Schema.java

package com.apiverve.jsonschemagenerator.data;

import com.fasterxml.jackson.annotation.*;

public class Schema {
    private String schema;
    private String title;
    private String type;
    private Properties properties;
    private String[] required;

    @JsonProperty("$schema")
    public String getSchema() { return schema; }
    @JsonProperty("$schema")
    public void setSchema(String value) { this.schema = value; }

    @JsonProperty("title")
    public String getTitle() { return title; }
    @JsonProperty("title")
    public void setTitle(String value) { this.title = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("properties")
    public Properties getProperties() { return properties; }
    @JsonProperty("properties")
    public void setProperties(Properties value) { this.properties = value; }

    @JsonProperty("required")
    public String[] getRequired() { return required; }
    @JsonProperty("required")
    public void setRequired(String[] value) { this.required = value; }
}

// Properties.java

package com.apiverve.jsonschemagenerator.data;

import com.fasterxml.jackson.annotation.*;

public class Properties {
    private Active name;
    private Active age;
    private Email email;
    private Active active;

    @JsonProperty("name")
    public Active getName() { return name; }
    @JsonProperty("name")
    public void setName(Active value) { this.name = value; }

    @JsonProperty("age")
    public Active getAge() { return age; }
    @JsonProperty("age")
    public void setAge(Active value) { this.age = value; }

    @JsonProperty("email")
    public Email getEmail() { return email; }
    @JsonProperty("email")
    public void setEmail(Email value) { this.email = value; }

    @JsonProperty("active")
    public Active getActive() { return active; }
    @JsonProperty("active")
    public void setActive(Active value) { this.active = value; }
}

// Active.java

package com.apiverve.jsonschemagenerator.data;

import com.fasterxml.jackson.annotation.*;

public class Active {
    private String type;

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }
}

// Email.java

package com.apiverve.jsonschemagenerator.data;

import com.fasterxml.jackson.annotation.*;

public class Email {
    private String type;
    private String format;

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("format")
    public String getFormat() { return format; }
    @JsonProperty("format")
    public void setFormat(String value) { this.format = value; }
}